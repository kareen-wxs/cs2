<template>

    <head>
        <title v-if="userData.lang_code == 'kz'">Админ панель | Ножи</title>
    </head>
    <AdminLayout>
        <template #breadcrumbs>
            <div class="row mb-2">
                <div class="col-sm-6">
                    <h1 class="m-0" v-if="userData.lang_code == 'kz'">Список ножей</h1>
                </div>
                <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                        <li class="breadcrumb-item">
                            <a :href="route('admin.index')">
                                <i class="fas fa-dashboard"></i>
                                {{ userData.lang_code == 'kz' ? 'Главная страница' : 'Ana sayfa' }}
                            </a>
                        </li>
                        <li class="breadcrumb-item active" v-if="userData.lang_code == 'kz'">
                            Список ножей
                        </li>
                    </ol>
                </div>
            </div>
        </template>
        <template #header>
            <div class="buttons d-flex align-items-center">
                <Link class="btn btn-primary mr-2" :href="route('admin.knives.create')"
                    v-if="userData.lang_code == 'kz'">
                <i class="fa fa-plus"></i> Добавить
                </Link>
            </div>
        </template>
        <div class="container-fluid">
            <div class="card">
                <div class="card-body">
                    <div class="row">
                        <div class="col-sm-12">
                            <table class="table table-hover table-bordered table-striped dataTable dtr-inline">
                                <thead>
                                    <tr knife="row">
                                        <th>Название</th>
                                        <th>Скин</th>
                                        <th>Цена</th>
                                        <th>Редкость</th>
                                        <th>Паттерн</th>
                                        <th>Износ</th>
                                        <th>Изображение</th>
                                        <th>Действия</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr class="odd" v-for="knife in knives" :key="'knife' + knife.id">
                                        <td>
                                            {{
                                                knife.id
                                            }}
                                        </td>
                                        <td>{{ knife.name }}</td>
                                        <td>{{ knife.skin }}</td>
                                        <td>{{ knife.price }} $</td>
                                        <td>{{ knife.rarity }}</td>
                                        <td>{{ knife.pattern }}</td>
                                        <td>{{ knife.wear }}</td>
                                        <td>
                                            <img v-if="knife.image" :src="`/storage/${knife.image}`" width="100">
                                        </td>
                                        <td>
                                            <div class="btn-group btn-group-sm">
                                                <Link :href="route('admin.knives.edit', knife.id)" class="btn btn-primary"
                                                    title="Изменить">
                                                <i class="fas fa-edit"></i>
                                                </Link>

                                                <button @click.prevent="deleteKnife(knife.id)" class="btn btn-danger"
                                                    title="Удалить">
                                                    <i class="fas fa-times"></i>
                                                </button>

                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <Pagination :links="knives.links" />
                </div>
            </div>
        </div>
    </AdminLayout>
</template>
<script>
import AdminLayout from "../../../Layouts/AdminLayout.vue";
import { Link, Head } from "@inertiajs/inertia-vue3";
import Pagination from "../../../Components/Pagination.vue";
export default {
    components: {
        AdminLayout,
        Link,
        Pagination,
        Head
    },
    props: ['knives'],
    data() {
        return {
            filter: {
                name: route().params.name ? route().params.name : null,
            },
            loading: 0,
        };
    },
    created() {
        this.$store.dispatch('fetchUser');
    },
    computed: {
        userData() {
            return this.$store.getters.getUserData.user;
        }
    },
    methods: {
        deleteKnife(id) {
            if (confirm('Удалить этот нож?')) {
                this.$inertia.delete(route('admin.knives.destroy', id));
            }
        },
        search() {
            this.loading = 1
            const params = this.clearParams(this.filter);
            this.$inertia.get(route('admin.knives.index'), params)
        },
    }
};
</script>
