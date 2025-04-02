<template>

    <head>
        <title>Админ панель | Музыканы өңдеу</title>
    </head>
    <AdminLayout>
        <template #breadcrumbs>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0">Музыканы өңдеу</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a :href="route('admin.index')">
                                <i class="fas fa-dashboard"></i>
                                {{ userData.lang_code == 'kz' ? 'Басты бет' : 'Ana sayfa' }}
                            </a>
                        </li>
                        <li class="breadcrumb-item">
                            <a :href="route('admin.knives.index')">
                                <i class="fas fa-dashboard"></i>
                                Музыкалар тізімі
                            </a>
                        </li>
                        <li class="breadcrumb-item active">
                            Музыканы өңдеу
                        </li>
                    </ol>
                </div>
            </div>
        </template>
        <div class="container-fluid">
            <div class="card card-primary">
                <form method="post" @submit.prevent="submit">
                    <div class="card-body">
                        <div class="form-group">
                            <label for="">Название:</label>
                            <input type="text" class="form-control" v-model="knife.name" name="name" />
                        </div>
                        <div class="form-group">
                            <label for="">Скин:</label>
                            <input type="text" class="form-control" v-model="knife.skin" name="artist" />
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
                            <label for="">Износ:</label>
                            <select class="form-control" v-model="knife.wear">
                                <option value="Factory New">Factory New</option>
                                <option value="Minimal Wear">Minimal Wear</option>
                                <option value="Field-Tested">Field-Tested</option>
                                <option value="Well-Worn">Well-Worn</option>
                                <option value="Battle-Scarred">Battle-Scarred</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="">Цена:</label>
                            <input type="number" class="form-control" v-model="knife.price" name="genre" />
                        </div>
                        <div class="form-group">
                            <label for="">Изображение:</label>
                            <input type="file" @change="handleFileChange">
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn-primary mr-1">
                            {{ userData.lang_code == 'kz' ? 'Сақтау' : 'Kaydet' }}
                        </button>
                        <button type="button" class="btn btn-danger" @click.prevent="back()">
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
    props: [
        'knife',
    ],
    created() {
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
            let formData = new FormData();
            formData.append("_method", "PUT");
            formData.append("name", this.knife.name);
            formData.append("skin", this.knife.skin);
            formData.append("wear", this.knife.wear);
            formData.append("price", this.knife.price);
            if (this.knife.image) {
                formData.append("image", this.knife.image);
            }
            this.$inertia.post(route("admin.knives.update", this.knife.id), formData);
        },
        back() {
            this.$inertia.visit(route("admin.knives.index"));
        },
    },
};
</script>
