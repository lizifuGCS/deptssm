package com.qst.bean;

import java.util.HashMap;
import java.util.Map;

public class Msg {
    private  int code;
    private  String  msg;
    private Map<String,Object> extend = new HashMap<String,Object>();


    public static  Msg success(){
        Msg ms = new Msg();
        ms.setCode(100);
        ms.setMsg("处理成功！");
        return  ms;
    }

    public static  Msg fail(){
        Msg ms = new Msg();
        ms.setCode(200);
        ms.setMsg("处理失败！");
        return  ms;
    }

    public  Msg add(String key,Object value){
        this.getExtend().put(key,value);
        return this;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
