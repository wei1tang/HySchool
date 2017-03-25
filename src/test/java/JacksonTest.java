package java;

import com.fasterxml.jackson.core.JsonEncoding;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;
import org.junit.Before;
import org.junit.Test;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by LJW on 2017/3/20.
 */
public class JacksonTest {

    private ObjectMapper objectMapper = null;
    private JsonGenerator jsonGenerator= null;
    private Vip vip = null;

    @Before
    public void init(){
        vip = new Vip();

        vip.setId(1);
        vip.setUserType(3);
        vip.setPassword("123");
        vip.setName("lvjinwang");
        vip.setEmail("769707043@qq.com");
        vip.setUpdateTime(new Date());
        vip.setState(1);
        vip.setCreateTime(new Date());
        vip.setBirthday(new Date());
        //vip.setResetPasswordTime(new Date());

        objectMapper = new ObjectMapper();
        try {
            jsonGenerator = objectMapper.getFactory().createGenerator(System.out, JsonEncoding.UTF8);
        } catch (IOException e) {
            e.printStackTrace();
        }

        //让Json可以缩进，可读性更好，一般用在测试和开发阶段。
        objectMapper.configure(SerializationFeature.INDENT_OUTPUT, true);
        //让map的key按自然顺序排列
        objectMapper.configure(SerializationFeature.ORDER_MAP_ENTRIES_BY_KEYS, true);
        //日期输出格式
        SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd");
        objectMapper.setDateFormat(outputFormat);

        //如果属性没有值，原本那么Json是会处理的，int类型为0，String类型为null，数组为[]，设置这个特性可以忽略空值属性
        //objectMapper.setSerializationInclusion(JsonInclude.Include.NON_EMPTY);
    }


    @Test
    public void jacksonTest(){
        Map<String, Object> demo = new HashMap<>();
        demo.put("status",true);
        demo.put("str","adfasdfsa");
        String str = null;
        try {
            str = objectMapper.writeValueAsString(demo);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println(str);
    }

    @Test
    public void vipJson(){
        String json = null;
        try {
            json = objectMapper.writeValueAsString(vip);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        System.out.println(json);

        Vip vipNew = new Vip();
        try {
            vipNew = objectMapper.readValue(json,Vip.class);
        } catch (IOException e) {
            e.printStackTrace();
        }
        System.out.println(vipNew.getEmail());
    }

    @Test
    public void listAndMap(){
        Map<String, Object> map = new HashMap();
        map.put("title", "Kind of blue");

        List<String> links = new ArrayList<>();
        links.add("links");
        links.add("links two");
        map.put("link", links);

        Map<String, Object> artist = new HashMap<>();
        artist.put("name", "lv jinwang");
        artist.put("name", new Date());
        artist.put("age", 23);
        map.put("artist", artist);

        map.put("price", 100);

        String json = null;
        try {
            json = objectMapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        System.out.println(json);
    }
}












class Vip {
    private Integer id;

    private String email;

    private String password;

    private String name;

    private Integer state;

    private Integer userType;

    private Date birthday;

    private Date createTime;

    private Date updateTime;

    private Date resetPasswordTime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getResetPasswordTime() {
        return resetPasswordTime;
    }

    public void setResetPasswordTime(Date resetPasswordTime) {
        this.resetPasswordTime = resetPasswordTime;
    }
}

