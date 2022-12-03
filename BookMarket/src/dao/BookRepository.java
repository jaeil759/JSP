package dao;
import java.util.ArrayList;
import dto.Book;
public class BookRepository {
	ArrayList<Book>listOfBooks=new ArrayList<Book>();
	private static BookRepository instance= new BookRepository();
	public static BookRepository getInstance() {
		return instance;
	}
	public BookRepository(){
		
		Book book1=new Book("Num1","HTML5+CSS",15000);
		book1.setDescription("워드나 PPT문서를 만들수 있나요? 그러면 문제 없습니다. 지금 바로 웹페이지에 도전하세요.");
		book1.setCategory("Hello Coding");
		book1.setPublisher("한빛미디어");
		book1.setAuthor("황재호");
		book1.setTotalPages(268);
		book1.setUnitsInStock(1500);
		book1.setReleaseDate("2018/03/07");
		book1.setFileName("P1234.png");
		book1.setCondition("New");
		/*
	String condition=request.getParameter("condition");*/
		Book book2=new Book("Num2","쉽게 배우는 자바 프로그래밍",27000);
		book2.setDescription("객체 지향의 핵심과 자바의 현대적 기능을 다루면서 초보자가 쉽게 학습할 수 있습니다.");
		book2.setCategory("IT모바일");
		book2.setPublisher("한빛아카데미");
		book2.setAuthor("우종중");
		book2.setTotalPages(308);
		book2.setUnitsInStock(2000);
		book2.setReleaseDate("2016/09/01");
		book2.setFileName("P1235.png");
		book2.setCondition("Refurbished");
		
		Book book3=new Book("Num3","스프링4 입문",27000);
		book3.setDescription("스프링은 단순히 사용 방법만 익히는것보다 아키텍쳐를 이해하는게 중요합니다!");
		book3.setCategory("IT모바일");
		book3.setPublisher("한빛미디어");
		book3.setAuthor("하세가와 유이치,오오노 와타루,토키 코헤이(권은철,전민수)");
		book3.setTotalPages(189);
		book3.setUnitsInStock(3000);
		book3.setReleaseDate("2019/05/03");
		book3.setCondition("Old");
		book3.setFileName("P1236.png");
		
		
		listOfBooks.add(book1);
		listOfBooks.add(book2);
		listOfBooks.add(book3);
	}
	public ArrayList<Book> getAllBooks(){
		return listOfBooks;
	}
	public void addProduct(Book book){
		listOfBooks.add(book);
	}
	public Book getBookById(String bookId){
		Book bookByid=null;
		
		for(int i=0;i<listOfBooks.size();i++)
		{
			Book book=listOfBooks.get(i);
			if(book!=null&&book.getBookId()!=null&&book.getBookId().equals(bookId))
			{
				bookByid=book;
				break;
			}
		}
		return bookByid;
	}
}