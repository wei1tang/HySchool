package com.hyschool.utils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.Map;

/**
 * Created by LJW on 2017/4/10.
 */
public class JsonUtil {

    private static final ObjectMapper mapper = new ObjectMapper();

    /**
     * 将对象变为json字符串
     *
     * @param obj
     * @return
     * @throws JsonProcessingException
     */
    public static String toJson(Object obj) throws JsonProcessingException {
        return mapper.writeValueAsString(obj);
    }


    /**
     * 将json字符串变为某个bean
     *
     * @param json
     * @param cls
     * @param <T>
     * @return
     * @throws IOException
     */
    @SuppressWarnings("unchecked")
    public static <T> T fromJson(String json, Class<T> cls) throws IOException {
        return mapper.readValue(json, cls);
    }


    /**
     * 将json字符串变为map
     *
     * @param json
     * @return
     * @throws IOException
     */
    @SuppressWarnings("unchecked")
    public static Map<String, Object> fromJson2Map(String json) throws IOException {
        return mapper.readValue(json, Map.class);
    }

}
