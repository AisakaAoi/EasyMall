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
		//1.创建workbook工作簿
		Workbook workbook=new XSSFWorkbook();
		//2.创建表单sheet
		Sheet sheet=workbook.createSheet("sheet1");
		//3.文件流
		FileOutputStream fout=new FileOutputStream("D:\\test1.xlsx");
		//4.创建行对象，下标从0开始
		Row row=sheet.createRow(0);
		//5.创建单元格
		Cell cell=row.createCell(0);
		cell.setCellValue("GG思密达");
		//6.创建单元格样式
		CellStyle cellStyle=workbook.createCellStyle();
		//设置边框(top,bottom,left,right)
		cellStyle.setBorderTop(BorderStyle.DOUBLE);
		//设置字体
		Font font=workbook.createFont();
		font.setFontName("华文细黑");//具体可以打开excel字体查看
		font.setFontHeightInPoints((short) 32);//设置字体大小
		cellStyle.setFont(font);
		//跨行跨列
		CellRangeAddress region=new CellRangeAddress(0,3,0,2);//(firstRow,lastRow,firstCol,lastCol)
		sheet.addMergedRegion(region);
		cellStyle.setAlignment(HorizontalAlignment.CENTER);//水平居中
		cellStyle.setVerticalAlignment(VerticalAlignment.CENTER);//垂直居中
		//应用样式
		cell.setCellStyle(cellStyle);
		//7.绘制图片
		//FileInputStream fin=new FileInputStream();
		//输出表格
		workbook.write(fout);
		fout.close();
	}
}
