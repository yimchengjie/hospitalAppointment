package evil.devil.entity;

public class Doctor {
    private Integer id;

    private String name;

    private String gender;

    private Integer departmentId;

    private String colleage;

    private Long tel;

    private String type;

    private String photo;

    private Integer price;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public Integer getDepartmentId() {
        return departmentId;
    }

    public void setDepartmentId(Integer departmentId) {
        this.departmentId = departmentId;
    }

    public String getColleage() {
        return colleage;
    }

    public void setColleage(String colleage) {
        this.colleage = colleage == null ? null : colleage.trim();
    }

    public Long getTel() {
        return tel;
    }

    public void setTel(Long tel) {
        this.tel = tel;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo == null ? null : photo.trim();
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

	public Doctor(String name, String gender, Integer departmentId, String colleage, Long tel, String type,
			String photo, Integer price) {
		super();
		this.name = name;
		this.gender = gender;
		this.departmentId = departmentId;
		this.colleage = colleage;
		this.tel = tel;
		this.type = type;
		this.photo = photo;
		this.price = price;
	}

	public Doctor() {
		super();
	}

	public Doctor(String name, String gender, Integer departmentId, String colleage, Long tel, String type,
			Integer price) {
		super();
		this.name = name;
		this.gender = gender;
		this.departmentId = departmentId;
		this.colleage = colleage;
		this.tel = tel;
		this.type = type;
		this.price = price;
	}

	public Doctor(Integer id, String name, String gender, Integer departmentId, String colleage, Long tel, String type,
			Integer price) {
		super();
		this.id = id;
		this.name = name;
		this.gender = gender;
		this.departmentId = departmentId;
		this.colleage = colleage;
		this.tel = tel;
		this.type = type;
		this.price = price;
	}

	@Override
	public String toString() {
		return "Doctor [id=" + id + ", name=" + name + ", gender=" + gender + ", departmentId=" + departmentId
				+ ", colleage=" + colleage + ", tel=" + tel + ", type=" + type + ", photo=" + photo + ", price=" + price
				+ "]";
	}


    
    
}