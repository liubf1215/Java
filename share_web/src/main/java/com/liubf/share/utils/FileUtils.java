package com.liubf.share.utils;


import org.springframework.web.multipart.MultipartFile;

 

import java.io.File;

import java.io.IOException;


/**

 * �ļ��ϴ�������

 * @author admin

 *

 */

 

public class FileUtils {

 

	

	/**

	 * 

	 * @param originalFilename

	 * @return

	 */

    public  String getFileName(String originalFilename){

        String fileName=String.valueOf(System.currentTimeMillis()) + "." + originalFilename;

        return fileName;

    }

    

    /**

     * �����ļ���

     * @param file

     * @return

     */

    public String getImgPath(MultipartFile file) {

            if("".equals(file.getOriginalFilename())){

               return null;

            }

            //��ȡ�ϴ�ͼƬ���ļ���,��Ϊʱ��+ͼƬ��

            String fileName = getFileName(file.getOriginalFilename());

            System.out.println("filename:" + fileName);

            String filePath = Constant.PICTURE_PATH  + fileName;

            //�����ļ�����

            File tagetFile = new File(Constant.PICTURE_PATH + fileName);

            //�ļ��������� ���½��ļ��������ļ����Ƶ��½��ļ���

            if (!tagetFile.exists()) {

                try {

                    tagetFile.createNewFile();

                } catch (IOException e) {

                    e.printStackTrace();

                }

                try {

                    //����ͼƬ

                    file.transferTo(tagetFile);

                    return fileName;

                } catch (IllegalStateException e) {

                    e.printStackTrace();

                } catch (IOException e) {

                    e.printStackTrace();

                }

            }

            return null;

    }

 

}

