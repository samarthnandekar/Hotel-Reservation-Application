package com.myhotelapp.helper;

import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfWriter;
import com.myhotelapp.pojo.Booking;
import com.myhotelapp.pojo.BookingItem;
import com.myhotelapp.pojo.Hotel;

public class PdfGenerator {

	public static void generateBookingPDF (Booking booking,
			HttpServletResponse response) throws IOException {
		
		response.setContentType("application/pdf");
		OutputStream out=response.getOutputStream();
		Document document = new Document();
		
		BookingItem storebookingItem=null;
		
		for(BookingItem bookingItem:booking.getBookingItemList())
		{
			storebookingItem=bookingItem;
		}
		
		System.out.println("inside the pdf file");
		
		PdfWriter pdfWriter = null;
		
		try {
			pdfWriter = PdfWriter.getInstance(document, response.getOutputStream());
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		document.open();
		
		String hotelimg=booking.getHotel().getImgName();
		
		String replaceStr=hotelimg.replace("/", "\\");
		replaceStr=replaceStr.replace("/", "\\");
		System.out.println("replaceStr--->"+replaceStr);
				
		String imgPath="C:\\Users\\samar\\Documents\\workspace-sts-3.7.3.RELEASE\\WebToolsProjectFinal\\src\\main\\webapp\\";
		
		String finalimgPath=imgPath+replaceStr;
		System.out.println("finalimgPath-->"+finalimgPath);
		
		try {
			//document.add(new Paragraph("Order Details of :" + loginDetails.getUserDetails().getFirstName() + ", " + loginDetails.getUserDetails().getLastName()));
			Image img=Image.getInstance(finalimgPath);
			img.scaleAbsolute(510,250);
			
			document.add(new Paragraph());
			document.add(new Paragraph());
			document.add(new Paragraph());
			document.add(new Paragraph());
			document.add(new Paragraph("                                Booking Details                          "));
			document.add(Chunk.NEWLINE );
			document.add(img);
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph());
			document.add(new Paragraph("Hotel Name :"+booking.getHotel().getHotelName()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Boking Date :"+booking.getBookingDate()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Booking Status :"+storebookingItem.getBookingStatus()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Check In Date :"+storebookingItem.getbStartDate()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Check out Date :"+storebookingItem.getbEndDate()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Check In Date :"+storebookingItem.getCost()));
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Allocated Room Number :"+storebookingItem.getRoom().getRoomNumber()));
			document.add(Chunk.NEWLINE );
			document.add(Chunk.NEWLINE );
			document.add(new Paragraph());
			document.add(new Paragraph("Thanks for Booking "));
			document.add(new Paragraph("Please contact for any help 6178427522"));
			document.add(new Paragraph("samarthnandekar@gmail.com"));
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("inside the pdf file end of ----end");
		document.close();
		out.close();
		System.out.println("inside the pdf file end of ----end");
	}
}
