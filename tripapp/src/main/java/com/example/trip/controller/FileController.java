package com.example.trip.controller;


import com.example.trip.aop.LogAnnotation;
import com.example.trip.entity.FileDto;
import com.example.trip.entity.FileItem;
import com.example.trip.utils.R;
import com.example.trip.utils.UUIDUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLDecoder;

@RestController
@RequestMapping("/trip/file")
@Api(tags = "文件接口")
public class FileController {

    @Value("${myData.imageDisc}")
    private String imageDisc;
    @Value("${myData.imageAccess}")
    private String imageAccess;

    @RequestMapping("/upload")
    @ApiOperation(value = "多文件上传的接口")
    @LogAnnotation(module = "文件",operator = "上传文件")
    public R upload(@RequestParam("picture") MultipartFile picture, HttpServletRequest request) {
        FileItem fileItem = new FileItem();
        System.out.println("您已进入图片上传服务");
        File filePath = new File(imageDisc);
        System.out.println("文件的保存路径：" + imageDisc);
        if (!filePath.exists() && !filePath.isDirectory()) {
            System.out.println("目录不存在，创建目录:" + filePath);
            filePath.mkdir();
        }
        //获取原始文件名称(包含格式)
        String originalFileName = picture.getOriginalFilename();
        System.out.println("原始文件名称：" + originalFileName);
        fileItem.setName(originalFileName);
        //获取文件类型，以最后一个`.`为标识
        String type = originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
        System.out.println("文件类型：" + type);
        //获取文件名称（不包含格式）
        String name = originalFileName.substring(0, originalFileName.lastIndexOf("."));

        String fileName = UUIDUtils.getUUID()+ "." + type;

        System.out.println("新文件名称：" + fileName);

        //在指定路径下创建一个文件
        File targetFile = new File(imageDisc, fileName);
        System.out.println("图片地址：" + imageDisc + "/" + fileName);
        //将文件保存到服务器指定位置
        try {
            picture.transferTo(targetFile);
            System.out.println("上传成功");
            //将文件在服务器的存储路径返回
            System.out.println(imageDisc + fileName);
            fileItem.setUrl(imageAccess+fileName);
//            return new FileResult(true,fileName,"http://localhost:8800/"+fileName);
            return R.ok().data("fileItem",fileItem);

        } catch (IOException e) {
            System.out.println("上传失败");
            e.printStackTrace();
//            return new FileResult(false, "上传失败","");
            return R.error();
        }
    }


//    @RequestMapping(value = "download", method = RequestMethod.POST)
//    @ApiOperation(value = "单个文件下载")
//    public HttpServletResponse download(@RequestBody FileDto fileDto, HttpServletResponse response) {
//        InputStream fis = null;
//        OutputStream toClient = null;
//        try {
//            // path是指欲下载的文件的路径。
//            String dirPath = fileDto.getPath();
//            // 取得文件名。
//            System.out.println("dirPath "+dirPath);
//            String filename = fileDto.getFileName();
//            System.out.println("filename "+filename);
//            File file = new File(URLDecoder.decode(fileDto.getPath(),"UTF-8"));
//            fis = new BufferedInputStream(new FileInputStream(file));
//            byte[] buffer = new byte[fis.available()];
//            fis.read(buffer);
//            fis.close();
//
//
//            // 清空response
//            response.reset();
//            // 解决跨域问题，这句话是关键，对任意的域都可以，如果需要安全，可以设置成安前的域名
//            response.addHeader("Access-Control-Allow-Origin", "*");
//            response.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
//            // 设置response的Header
//            response.setHeader("Content-Disposition", "attachment;filename="
//                    + new String(filename.getBytes(),"iso-8859-1"));
//            response.addHeader("Content-Length", "" + file.length());
//            toClient = new BufferedOutputStream(response.getOutputStream());
//            response.setContentType("application/octet-stream");
//
//            toClient.write(buffer);
//            toClient.flush();
//            toClient.close();
//
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }finally {
//            try { // close input stream
//                if (fis != null) {
//                    fis.close();
//                }
//            } catch(Exception ex) {
//            }
//            try { // close output stream
//                if (toClient != null) {
//                    toClient.close();
//                }
//            } catch(Exception ex) {
//            }
//        }
//        return response;
//    }

    @RequestMapping(value = "download", method = RequestMethod.POST)
    @ApiOperation(value = "文件下载接口")
    public static void downloadFile(@RequestBody FileDto fileDto, HttpServletResponse resp) throws IOException {
        String fName = fileDto.getPath().trim();
        String fileName = fName.substring(fName.lastIndexOf("/") + 1);
        String filePath = null;
        try {

            filePath = URLDecoder.decode(fileDto.getPath(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        String realPath = "E:" + File.separator + "img";
        //String realPath=filePath;//项目路径下你存放文件的地方
        String path = realPath + File.separator + fileName;//加上文件名称
        File file = new File(path);
        if (!file.exists()) {
            throw new IOException("文件不存在");
        }
//        name = new String(name.getBytes("GBK"), "ISO-8859-1");
        fileDto.setFileName(new String(fileDto.getFileName().getBytes("GBK"), "ISO-8859-1"));
        resp.reset();
        /*
         * 跨域配置
         * */
        resp.addHeader("Access-Control-Allow-Origin", "*");
        resp.addHeader("Access-Control-Allow-Methods", "GET, POST, PUT, DELETE");
        resp.addHeader("Access-Control-Allow-Headers", "Content-Type");

        resp.setContentType("application/octet-stream");
        resp.setCharacterEncoding("utf-8");
        resp.setContentLength((int) file.length());
        resp.setHeader("Content-Disposition", "attachment;filename=" + fileDto.getFileName());
        byte[] buff = new byte[1024];
        BufferedInputStream bis = null;
        OutputStream os = null;
        try {
            os = resp.getOutputStream();
            bis = new BufferedInputStream(new FileInputStream(file));
            int i = 0;
            while ((i = bis.read(buff)) != -1) {
                os.write(buff, 0, i);
                os.flush();
            }
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                bis.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }


}
