import Mock from 'mockjs'
//引入准备好的模拟数据
import banner from './banner.json'

const Random = Mock.Random;

//模拟酒店信息
const hotelData = function () {
    let listdata = []
    for (let i = 0; i < 10; i++) {
        let obj = {
            id: Random.id(),
            describe: Random.csentence(),
            name: Random.ctitle(), //  Random.ctitle( min, max ) 随机产生一个中文标题，长度默认在3-7之间
            address: Random.city(), // Random.cparagraph(min, max) 随机生成一个中文段落，段落里的句子个数默认3-7个
            imgUrl: Random.image('280x200'),
            price: Random.natural(100, 900),
            phone: Random.natural()
        }
        listdata.push(obj)
    }
    return listdata
}

//模拟景点信息
const scenceData = function () {
    let listdata = []
    for (let i = 0; i < 10; i++) {
        let obj = {
            id: Random.id(),
            // spotDescribe: Random.csentence(),
            spotName: Random.ctitle(), //  Random.ctitle( min, max ) 随机产生一个中文标题，长度默认在3-7之间
            spotAddress: Random.city(), // Random.cparagraph(min, max) 随机生成一个中文段落，段落里的句子个数默认3-7个
            spotPrice: Random.natural(100, 900),
            imgUrl: Random.image('280x200'),
            spotDescribe: Random.cparagraph()
        }
        listdata.push(obj)
    }
    return listdata
}

Mock.mock("/mock/banner", 'get', { code: 200, data: banner })
Mock.mock("/mock/hotel", 'get', { code: 200, data: hotelData })
Mock.mock("/mock/scence", 'get', { code: 200, data: scenceData })
//模拟登录信息
Mock.mock("/mock/login", 'post', (req) => {
    console.log(req);
    const { password, username } = JSON.parse(req.body)
    if (username === '123' && password === '123') {
        return {
            code: 200,
            token: 'testlogin'
        }
    } else {
        return {
            code: 400
        }
    }
})

//模拟用户登出
Mock.mock("/mock/logout", 'get', { code: 200 })

//模拟查询旅游景点信息
Mock.mock(/\/mock\/travel\/search/, 'get', (option) => {
    let keyword = option.url.split('/')[option.url.split('/').length - 1]
    if(keyword === '1') {
        return {
            code: 200,
            message: '获取数据成功',
            data: scenceData
        }
    }else {
        return {
            code: 400
        }
    }
})

//模拟查询酒店信息
Mock.mock(/\/mock\/hotel\/search/, 'get', (option) => {
    let keyword = option.url.split('/')[option.url.split('/').length - 1]
    if(keyword === '2') {
        return {
            code: 200,
            message: '获取数据成功',
            data: hotelData
        }
    }else {
        return {
            code: 400
        }
    }
})


//模拟预订门票



