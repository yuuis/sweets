import Vuex from 'vuex';

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
                });

                if (response.status == 200) {

                    commit('update', {
                        'access-token': response.headers['access-token'],
                        'uid': response.headers['uid'],
                        'client': response.headers['client']
                    })
                }

                console.log(response);
            },

            nuxtServerInit ({commit}, {req}) {
                let accessToken = null;
                if (req.headers.cookie) {
                    var parsed = cookieparser.parse(req.headers.cookie);
                    accessToken = JSON.parse(parsed.auth);
                }
                commit('update', accessToken);
            }
        }
    })