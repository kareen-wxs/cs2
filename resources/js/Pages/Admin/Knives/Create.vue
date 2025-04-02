<template>

    <head>
        <title>Админ панель | Добавить нож</title>
    </head>
    <AdminLayout>
        <template #breadcrumbs>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Добавить нож</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a :href="route('admin.index')">
                                <i class="fas fa-dashboard"></i>
                                Главная страница
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a :href="route('admin.knives.index')">
                                <i class="fas fa-dashboard"></i>
                                Список ножей
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Добавить нож
                        </li>
                    </ol>
                </div>
            </div>
        </template>
        <div class="container-fluid">
            <div class="card card-primary">
                <form @submit.prevent="submit">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="name">Название:</label>
                            <input type="text" class="form-control" v-model="knife.name" required />
                        </div>
                        <div class="form-group">
                            <label for="skin">Скин:</label>
                            <input type="text" class="form-control" v-model="knife.skin" required />
                        </div>
                        <div class="form-group">
                            <label for="rarity">Редкость:</label>
                            <select class="form-control" v-model="knife.rarity">
                                <option value="Common">Common</option>
                                <option value="Uncommon">Uncommon</option>
                                <option value="Rare">Rare</option>
                                <option value="Epic">Epic</option>
                                <option value="Legendary">Legendary</option>
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="wear">Износ:</label>
                            <select class="form-control" v-model="knife.wear">
                                <option value="Factory New">Factory New</option>
                                <option value="Minimal Wear">Minimal Wear</option>
                                <option value="Field-Tested">Field-Tested</option>
                                <option value="Well-Worn">Well-Worn</option>
                                <option value="Battle-Scarred">Battle-Scarred</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">Цена:</label>
                            <input type="number" class="form-control" v-model="knife.price" required />
                        </div>
                        <div class="form-group">
                            <label for="pattern">Паттерн:</label>
                            <input type="text" class="form-control" v-model="knife.pattern" />
                        </div>
                        <div class="form-group">
                            <label for="image">Изображение:</label>
                            <input type="file" @change="handleFileChange" />
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary mr-1">
                            {{ userData.lang_code == 'kz' ? 'Сақтау' : 'Kaydet' }}
                        </button>
                        <button type="button" class="btn btn-danger" @click="back">
                            {{ userData.lang_code == 'kz' ? 'Артқа' : 'Dönüş' }}
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </AdminLayout>
</template>
<script>
import AdminLayout from "../../../Layouts/AdminLayout.vue";
import { Link, Head } from "@inertiajs/inertia-vue3";
import Pagination from "../../../Components/Pagination.vue";
import ValidationError from "../../../Components/ValidationError.vue";

export default {
    components: {
        AdminLayout,
        Link,
        Pagination,
        ValidationError,
        Head
    },
    props: ["knife"],
    data() {
        return {
            knife: this.knife
        }
    },
    created() {
    console.log(this.knife); // Должно вывести объект ножа
    this.$store.dispatch('fetchUser');
},
    computed: {
        userData() {
            return this.$store.getters.getUserData.user;
        }
    },
    methods: {
        handleFileChange(event) {
            const file = event.target.files[0];
            this.knife.image = file;
        },
        submit() {
            const formData = new FormData();
            formData.append("name", this.knife.name);
            formData.append("skin", this.knife.skin);
            formData.append("wear", this.knife.wear);
            formData.append("price", this.knife.price);
            formData.append("pattern", this.knife.pattern);
            formData.append("rarity", this.knife.rarity);
            if (this.knife.image) {
                formData.append("image", this.knife.image);
            }

            this.$inertia.post(route("admin.knives.store"), formData);
        },


    },
};
</script>
