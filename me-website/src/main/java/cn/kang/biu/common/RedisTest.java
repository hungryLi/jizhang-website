package cn.kang.biu.common;

import java.util.Set;

import redis.clients.jedis.Jedis;

public class RedisTest {

	public static void main(String[] args) {

			
		Jedis jedis = new Jedis("192.168.0.241", 6379);
		jedis.auth("OGc2017.,");
		Set<String> keys = jedis.keys("*");
		for (String key : keys) {
			System.out.println(key +"   ");
		}
		
	}

}
