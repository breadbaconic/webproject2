package user;

public class Person {
	private int id;
	private String username;
	private String nickname;
	private String comefrom;
	private int friendsNumber;
	private int weiboNumber;
	private int listenerNumber;
	private String image;
	

	public Person(int id, String username, String nickname,
			String comefrom, int friendsNumber, int weiboNumber, int listenerNumber) {
		super();
		this.id = id;
		this.username = username;
		this.nickname = nickname;
		this.comefrom = comefrom;
		this.friendsNumber = friendsNumber;
		this.weiboNumber = weiboNumber;
		this.listenerNumber = listenerNumber;
	}
	
	public Person(int id, String nickname, String image) {
		this.id = id;
		this.nickname = nickname;
		this.image = image;
	}

	public Person(int id, String nickname, int listenerNumber, String image) {
		this.id = id;
		this.nickname = nickname;
		this.listenerNumber = listenerNumber;
		this.image = image;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getComefrom() {
		return comefrom;
	}

	public void setComefrom(String comefrom) {
		this.comefrom = comefrom;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getFriendsNumber() {
		return friendsNumber;
	}

	public void setFriendsNumber(int friendsNumber) {
		this.friendsNumber = friendsNumber;
	}

	public int getWeiboNumber() {
		return weiboNumber;
	}

	public void setWeiboNumber(int weiboNumber) {
		this.weiboNumber = weiboNumber;
	}

	public int getListenerNumber() {
		return listenerNumber;
	}

	public void setListenerNumber(int listenerNumber) {
		this.listenerNumber = listenerNumber;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
	

}