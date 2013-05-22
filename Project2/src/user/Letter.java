package user;

public class Letter {
	private int senderid;
	private int receiverid;
	private String title;
	private String content;
	private boolean isRead;
	private String sendernickname;
	
	public Letter(String title, String content, String sendernickname, boolean isRead) {
		this.title = title;
		this.content = content;
		this.sendernickname = sendernickname;
		this.isRead = isRead;
	}

	public int getSenderid() {
		return senderid;
	}

	public void setSenderid(int senderid) {
		this.senderid = senderid;
	}

	public int getReceiverid() {
		return receiverid;
	}

	public void setReceiverid(int receiverid) {
		this.receiverid = receiverid;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(boolean isRead) {
		this.isRead = isRead;
	}

	public String getSendernickname() {
		return sendernickname;
	}

	public void setSendername(String sendernickname) {
		this.sendernickname = sendernickname;
	}
	
	

}
