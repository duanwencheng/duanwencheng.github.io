import java.io.File;
import jxl.Workbook;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

public class test {
	public static void main(String[] args) throws Exception {
		File excel = new File("C:/input.xls");
		Workbook book = Workbook.getWorkbook(excel);
		WritableWorkbook wbBook = Workbook.createWorkbook(excel, book);

		WritableSheet inputSheet = (WritableSheet) wbBook.getSheet(0);
		inputSheet.getSettings().setProtected(false);
		String code;// 服务编码

		for (int i = 0; i < inputSheet.getRows(); i++) {// Row 行
			code = inputSheet.getCell(3, i).getContents();
			System.out.println(code);
			if (code.equals("/")) {
				inputSheet.removeRow(i);
			}
		}
		wbBook.write();
		wbBook.close();
		book.close();
	}
}
