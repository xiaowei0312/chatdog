package com.sxsram.ssm.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;

public class FileUtil {
	public static String readFileContent(String file) throws Exception {
		StringBuilder result = new StringBuilder();
		BufferedReader br = new BufferedReader(new FileReader(file));// 构造一个BufferedReader类来读取文件
		String s = null;
		while ((s = br.readLine()) != null) {// 使用readLine方法，一次读一行
			result.append(System.lineSeparator() + s);
		}
		br.close();
		return result.toString();
	}

	public static void writeContentToFile(String content, String fileName) throws Exception {
		File file = new File(fileName);
		if (!file.exists())
			file.createNewFile();
		BufferedWriter bw = new BufferedWriter(new FileWriter(file.getAbsolutePath()));// 构造一个BufferedReader类来读取文件
		bw.write(content);
		bw.close();
	}
}
