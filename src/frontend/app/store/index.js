import Vuex from 'vuex';
import Cookie from "js-cookie";

var cookieparser = require('cookieparser');

export default() => new Vuex.Store({
        state: {
            auth: null
        },
        mutations: {
            update (state, data) {
                state.auth = data
            }
        },
        actions: {
            async login ({commit}, form) {
                const response = await this.$axios({
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json;charset=UTF-8',
                        "Access-Control-Allow-Origin": "*",
                    },
                    url: 'api/v1/auth/sign_in',
                    data: {
                        // 'email': form.email,
                        // 'password': form.password
                        'email': 'ishiguro@example.com',
                        'password': '3lkh4jg0dfkj345hl23'
                    }
                }).catch(err => {
                    return false;
                })

                if (response.status == 200) {
                    const auth = {
                        'access-token': response.headers['access-token'],
                        'uid': response.headers['uid'],
                        'client': response.headers['client']
                    };

                    Cookie.set("auth", auth);
                    commit('update', auth);
                    return true;
                } else return false;
            }
        }
    })