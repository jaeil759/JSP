package dto;

public class DropboxVO {
	private String file_id;		// 파일 id
	private String file_name;	// 파일명
	private int file_size;		// 파일사이즈
	private String file_type;	// 파일유형(image,pdf,excel,doc,txt 등등)
	private String file_mime;	// 파일 MIME
	public String getFile_id() {
		return file_id;
	}
	public void setFile_id(String file_id) {
		this.file_id = file_id;
	}
	public String getFile_name() {
		return file_name;
	}
	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_type() {
		return file_type;
	}
	public void setFile_type(String file_type) {
		this.file_type = file_type;
	}
	public String getFile_mime() {
		return file_mime;
	}
	public void setFile_mime(String file_mime) {
		this.file_mime = file_mime;
	}
}
