<template>
        <div class="theme-menu-wrapper">
            <div class="container">
                <div class="bg-wrapper clearfix">
                    
                    <div class="menu-wrapper float-left">
                        <nav id="mega-menu-holder" class="clearfix">
                            <ul class="clearfix">
                                <li><a href="/main">Главная</a></li>
                                <li><a href="/contact">Контакты</a></li>
                                <li><a href="/cart">Корзина</a></li>

                            </ul>
                        </nav> 
                    </div> 

                    <div class="right-widget float-right">
                        <ul>
                            <li class="social-icon">
                                <ul>
                                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-linkedin" aria-hidden="true"></i></a></li>
                                    <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                                </ul>
                            </li>
                        </ul>
                    </div> 
                </div> 
            </div>
        </div> 
 
</template>

<script>
import { isEmpty } from 'lodash';

export default {
    data() {
        return {
            currentDate: new Date,
        };
    },
    methods: {
    }
};
</script>

<style>
.nova-square-regular {
  font-family: "Nova Square", sans-serif;
  font-weight: 400;
  font-style: normal;
  font-size: 25px;
  font-weight: 800;
}

.aadress-wrapper {
    text-align: right;
}

.theme-menu-wrapper {
    background-color: #333;
    padding: 10px 0;
}
</style>
