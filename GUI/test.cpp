#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <conio.h>
#include <file.h>
#include <pc.h>
#include "gui.h"
#include "math.h"

BYTE header[54];
int show = 0;

void screenshot(char *bmp)
{
	FILE *fp;
	
	fp = fopen(bmp, "wb");
	if(fp == NULL) panic("cannot open out.bmp");	
	
	fwrite(header, 54, 1, fp);
	Mouse->Draw();
	fwrite(Screen->buffer, Screen->ScreenWidth*Screen->ScreenHeight*Screen->bpp, 1, fp);
	Mouse->Clear();
	
	fclose(fp);
}

void SetWallpaper()
{
	FILE *fp;

	fp = fopen("wall.bmp", "rb");
	if(fp == NULL) exit(1);
	//	fseek(fp, 54, SEEK_SET);
	fread(header, 54, 1, fp);

	fseek(fp, (768-Screen->ScreenHeight)*3*1024, SEEK_CUR);
	for(int y=(Screen->ScreenHeight-1)*Screen->ScreenWidth; y>=0; y-=Screen->ScreenWidth)
	{
		for(int x=0; x<Screen->ScreenWidth; x++)
		{
			fread(&Screen->background[(x+y)*Screen->bpp], 3, 1, fp);
		}

		fseek(fp, (1024-Screen->ScreenWidth)*3, SEEK_CUR);
	}

	memcpy(Screen->buffer, Screen->background, Screen->ScreenWidth*Screen->ScreenHeight*Screen->bpp);
	fclose(fp);
}

CForm *Form;
CLabel *Label;
CButton *Button;
CEdit *Edit;
CListBox *ListBox;

CForm *MainForm;
CButton *FlatButton;

CMenu *Menu;

BITMAP back, glyph;
char buf[512];

void wndproc(MSG *msg)
{
	if(msg->handle == (DWORD) Form)
	{
		switch(msg->message)
		{
			case WM_PAINT:
							int width, height, left, top;

							Form->GetSize(width, height);
							Form->GetPosition(left, top);

							for(int y=22; y<height-back.biHeight; y+=back.biHeight)
								for(int x=2; x<width-back.biWidth; x+=back.biWidth)
									Screen->Bitmap(x+left, y+top, &back, 0);
							break;
		}
	}

	if(msg->handle == (DWORD) Form->CloseButton)
	{
		switch(msg->message)
		{
			case WM_CLICK:
							//DestroyWindow(Form);
							Form->HideWindow();
							return;
		}
	}
								

	if(msg->handle == (DWORD) ListBox)
	{
		switch(msg->message)
		{
			case WM_MOUSEDOWN:
							sprintf(buf, "Item number %d selected", ListBox->GetPos());
							Label->SetText(buf);				
							break;
		}
	}
}	

void mainwndproc(MSG *msg)
{
	if(msg->handle == (DWORD) FlatButton)
	{
		switch(msg->message)
		{
			case WM_CLICK:
							Form->ShowWindow();
							Menu->Popup(100, 100);
							break;
		}
	}

	if(msg->handle == (DWORD) MainForm)
	{
		switch(msg->message)
		{
			case WM_MOUSEMOVE:
//							if(MainForm->mousedown)
//								MainForm->StartMoving();
//							sprintf(buf, "%d %d", msg->lparam&0xFF, msg->lparam>>16);
//							Label->SetText(buf);
							break;
/*			case WM_PAINT:
							int left, top, width, height;
							MainForm->GetPosition(left, top);
							MainForm->GetSize(width, height);
							Screen->RoundRect(left, top, width, height, 16, 0xFFFFFF, 1);
							Screen->RoundRect(left, top, width, height, 16, 0, 0);
							break;*/
		}
	}

	if(msg->handle == (DWORD) Menu)
	{
		sprintf(buf, "Item number %d clicked", msg->lparam);
		Label->SetText(buf);
	}
}

void dummy(MSG *msg)
{

}

int main()
{
	Screen = new CScreen(MODE_1024x768x24);
	Mouse = new CMouse;
	SetWallpaper();

	// test program
 	Form = CreateWindow(400, 100, 250, 320, "Window", WS_CLOSEBUTTON | WS_ALPHABLEND, wndproc);
	Label = new CLabel(2, 0, 100, 12, "Hello world!", 16);
	Button = new CButton(91, 231, 61, 23, "Test", BS_BITMAP);
	Edit = new CEdit(2, 232, 83, 20);
	ListBox = new CListBox(2, 18, 150, 210);

	LoadBitmap("back.bmp", &back);  	
	LoadBitmap("exit.bmp", &glyph);
	Button->SetBitmap(&glyph);
	free(glyph.data);
	ListBox->Add("Item number 1");
	ListBox->Add("This is a VERY LONG item ...");
	ListBox->Add("Multiple lines\nline 1\nline 2\nline 3");
	for(int i=4; i<30; i++)
	{
		sprintf(buf, "Item number %d", i);
		ListBox->Items.Add(buf);
	}
	ListBox->SetPos(1);

	Form->Add(Label);
	Form->Add(Button);
	Form->Add(Edit);
	Form->Add(ListBox);
	// end

	// main program
	MainForm = CreateWindow(10, 10, 200, 130, "Main window", WS_VISIBLE | WS_ALPHABLEND, mainwndproc);
	FlatButton = new CButton(2, 2, 100, 100, "Main program", BS_BITMAP | BS_IMAGEONTOP | BS_ROUNDRECT | BS_CENTER);
	FlatButton->SetButtonType(FLATBUTTON);
	FlatButton->SetColor(RGB(192, 192, 192));
	FlatButton->SetActiveColor(RGB(100, 177, 255));
	FlatButton->SetTextColor(RGB(255, 255, 255));
	FlatButton->SetActiveBorderColor(RGB(255, 255, 255));
	LoadBitmap("folder1.bmp", &glyph);
	FlatButton->SetBitmap(&glyph);
	free(glyph.data);

	MainForm->Add(FlatButton);

	CreateMask(MainForm, 0xBEDEAD, MASK_GET);
	CreateMask(FlatButton, 0xBEDEAD, MASK_GET);
	// end

	Mouse->Init();
	Mouse->SetCursorPos(300, 300); 
	Screen->RepaintRect(0, 0, Screen->ScreenWidth-1, Screen->ScreenHeight-1, 1);

	Menu = new CMenu(10, 10, 0, mainwndproc);

	LoadBitmap("exit.bmp", &glyph);
	Menu->AddItem("Item 1", &glyph);
	free(glyph.data);

	LoadBitmap("send.bmp", &glyph);
	Menu->AddItem("Item 2", &glyph);
	free(glyph.data);

	LoadBitmap("users.bmp", &glyph);
	Menu->AddItem("Item 3", &glyph);
	free(glyph.data);

	LoadBitmap("cog.bmp", &glyph);
	Menu->AddItem("Item 4", &glyph);
	free(glyph.data);

	Screen->AddWindow(Menu);

	int c, num = 1;

	while((c = getkey()) != K_Escape)
	{
		if(c == K_F1)
		{
			sprintf(buf, "%d.bmp", num++);
			screenshot(buf);
		}
		else
			Screen->KeyDown(c);
	}

	free(back.data);
	delete Mouse;
	delete Screen;

	return 0;
}
