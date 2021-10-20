const Base = require('./base.js');
const md5 = require('md5');

module.exports = class extends Base {

  async saveAction() {

    const email = this.post('email');
    const password = this.post('password');
    const merchant_name = this.post('merchant_name');
    const clientIp = this.ctx.ip;
    
    // 根据email查找是否已经注册
    let merchantId = await this.model('merchant').where({ email: email }).getField('id', true);
    
    if (think.isEmpty(merchantId)) {
      // 添加公司
      merchantId = await this.model('merchant').add({
        email: email,
        password: think.md5(password + '' + 'ABCDEF'),
        password_salt: 'ABCDEF', //md5 加密 密码盐
        register_time: parseInt(new Date().getTime() / 1000),
        register_ip: clientIp,
        mobile: '',
        merchant_name: merchant_name,
      });
      return this.success({ merchant_name: merchant_name, email: email, id: merchantId });
    } else {
      return this.fail('该邮箱已经被注册！');
    }
  }

  async loginAction() {
    const email = this.post('email');
    const password = this.post('password');

    const merchant = await this.model('merchant').where({ email: email }).find();
    if (think.isEmpty(merchant)) {
      return this.fail(401, '用户名或密码不正确1');
    }

    if (think.md5(password + '' + user.password_salt) !== user.password) {
      return this.fail(400, '用户名或密码不正确2');
    }

    // 更新登录信息
    await this.model('merchant').where({ id: user.id }).update({
      last_login_time: parseInt(Date.now() / 1000),
      last_login_ip: this.ctx.ip
    });

    const TokenSerivce = this.service('token', 'api');
    const sessionKey = await TokenSerivce.create({
      merchant_id: merchant.id
    });

    if (think.isEmpty(sessionKey)) {
      return this.fail('登录失败');
    }

    const merchantInfo = {
      id: merchant.id,
      email: merchant.email,
      merchant_name: merchant.nickname,
    };

    return this.success({ token: sessionKey, merchantInfo: merchantInfo });
  }


  async logoutAction() {
    return this.success();
  }
};
