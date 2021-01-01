package easymall.controller.admin;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import easymall.po.Category;
import easymall.service.ProductsService;

@Controller("chartsController")
@RequestMapping("/charts")
public class ChartsController {
	@Autowired
	private ProductsService productsService;
	@RequestMapping("/sales")
	public String sales() {
		return "echartsTest";
	}
	@RequestMapping("/testJson")
	@ResponseBody
	public List<Category> testJson() {
		List<Category> categories=productsService.allcategorys();
		return categories;
	}
	@Test
	public void test1() throws Exception{
		//1.����workbook������
		Workbook workbook=new XSSFWorkbook();
		//2.������sheet
		Sheet sheet=workbook.createSheet("sheet1");
		//3.�ļ���
		FileOutputStream fout=new FileOutputStream("D:\\test1.xlsx");
		//4.�����ж����±��0��ʼ
		Row row=sheet.createRow(0);
		//5.������Ԫ��
		Cell cell=row.createCell(0);
		cell.setCellValue("GG˼�ܴ�");
		//6.������Ԫ����ʽ
		CellStyle cellStyle=workbook.createCellStyle();
		//���ñ߿�(top,bottom,left,right)
		cellStyle.setBorderTop(BorderStyle.DOUBLE);
		//��������
		Font font=workbook.createFont();
		font.setFontName("����ϸ��");//������Դ�excel����鿴
		font.setFontHeightInPoints((short) 32);//���������С
		cellStyle.setFont(font);
		//���п���
		CellRangeAddress region=new CellRangeAddress(0,3,0,2);//(firstRow,lastRow,firstCol,lastCol)
		sheet.addMergedRegion(region);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);//ˮƽ����
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);//��ֱ����
		//Ӧ����ʽ
		cell.setCellStyle(cellStyle);
		//7.����ͼƬ
		//FileInputStream fin=new FileInputStream();
		//������
		workbook.write(fout);
		fout.close();
	}
}
