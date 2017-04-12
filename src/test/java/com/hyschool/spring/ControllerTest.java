package com.hyschool.spring;

import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

/**
 * Created by LJW on 2017/4/13.
 */
public class ControllerTest extends BaseSpringTestCase {

    public MockMvc mockMvc;

    @Autowired
    private WebApplicationContext wac;


    /**
     * 初始化webApp
     */
    @Before
    public void setUp() {
        mockMvc = MockMvcBuilders.webAppContextSetup(wac).build();
    }


    /**
     * 通过返回的viewName测试是否成功
     *
     * @throws Exception
     */
    @Test
    public void testController() throws Exception {
        MvcResult result = getResult(MockMvcRequestBuilders.post("/vip/login")
                .param("email", "769707043@qq.com").param("password", "123123"));//请求参数
        System.out.println(result.getModelAndView().getViewName());

        /*String resultJson = result.getResponse().getContentAsString();
        Map<String,Object> map = JsonUtil.fromJson2Map(resultJson);
        Assert.assertEquals(0,map.get("result"));//断言是否成功*/
    }


    /**
     * 得到controller返回来的总的结果
     *
     * @param requestBuilder
     * @return
     * @throws Exception
     */
    public MvcResult getResult(MockHttpServletRequestBuilder requestBuilder) throws Exception {
        MvcResult result = mockMvc.perform(requestBuilder.characterEncoding("utf-8")).andReturn();
        result.getResponse().setCharacterEncoding("utf-8");
        return result;
    }
}
