package com.example.trip;




import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.generator.AutoGenerator;
import com.baomidou.mybatisplus.generator.config.DataSourceConfig;
import com.baomidou.mybatisplus.generator.config.GlobalConfig;
import com.baomidou.mybatisplus.generator.config.PackageConfig;
import com.baomidou.mybatisplus.generator.config.StrategyConfig;
import com.baomidou.mybatisplus.generator.config.rules.DateType;
import com.baomidou.mybatisplus.generator.config.rules.NamingStrategy;

public class autoCode {
    public static void main(String[] args) {
        //需要构建一个代码自动生成器
        AutoGenerator mpg = new AutoGenerator();
        //配置策略
        //1、全局配置
        GlobalConfig gc = new GlobalConfig();
//        String property = System.getProperty("user.dir");
        gc.setOutputDir("H:\\gitHome\\trip"+"/src/main/java");
        gc.setOpen(false); //生成后是否打开资源管理器
        gc.setFileOverride(false); //重新生成时文件是否覆盖
        gc.setServiceName("%sService");	//去掉Service接口的首字母I
        gc.setIdType(IdType.AUTO); //主键策略
        gc.setDateType(DateType.ONLY_DATE);//定义生成的实体类中日期类型
        gc.setSwagger2(true);//开启Swagger2模式
        mpg.setGlobalConfig(gc);

        //2、数据源配置
        DataSourceConfig dsc = new DataSourceConfig();
        dsc.setUrl("jdbc:mysql://localhost:3306/travel?useSSL=false&useUnicode=ture&characterEncoding=UTF-8&serverTimezone=GMT%2B8");
        dsc.setUsername("root");
        dsc.setPassword("123456");
        dsc.setDriverName("com.mysql.cj.jdbc.Driver");
        dsc.setDbType(DbType.MYSQL);
        mpg.setDataSource(dsc);

        //3、包配置
        PackageConfig pc = new PackageConfig();
        pc.setParent("com.example");
        pc.setModuleName("trip"); //模块名
        pc.setController("controller");
        pc.setEntity("entity");
        pc.setService("service");
        pc.setMapper("mapper");
        mpg.setPackageInfo(pc);

        //策略配置
        StrategyConfig strategy = new StrategyConfig();
        strategy.setInclude("role"); //要映射的表名
        strategy.setNaming(NamingStrategy.underline_to_camel);//表名下划线转驼峰命名
//        strategy.setTablePrefix(pc.getModuleName() + "_");//去表前缀
        strategy.setColumnNaming(NamingStrategy.underline_to_camel);//表字段下划线转驼峰命名

        strategy.setEntityLombokModel(true);
        strategy.setRestControllerStyle(true);
        strategy.setControllerMappingHyphenStyle(true);
        mpg.setStrategy(strategy);



        mpg.execute();//执行代码构造器
    }
}

