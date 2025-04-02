<template>
  <div>
    <Header />
    <div class="cart-content">
    <h2 class="mt-5">Корзина</h2>
    <table v-if="cart.length > 0" class="cart-table ">
      <thead>
        <tr>
          <th>Название</th>
          <th>Цена (₸)</th>
          <th>Количество</th>
          <th>Удалить</th>
        </tr>
      </thead>
      <tbody>
        <tr v-for="item in cart" :key="item.id">
          <td>{{ item.name }}</td>
          <td>{{ item.price }}</td>
          <td>{{ item.quantity }}</td>
          <td>
            <button class="btn btn-warning" @click="removeFromCart(item.id)">Удалить</button>
          </td>
        </tr>
      </tbody>
    </table>

    <p v-if="cart.length > 0" class="total-price">Общая сумма: <b>{{ totalPrice }} ₸</b></p>
    <button v-if="cart.length > 0" @click="checkout" class="checkout-btn">Оформить заказ</button>

    <p v-else>Корзина пуста</p>
  </div>
  </div>
</template>

<script>
import Header from '../../Components/header.vue';
export default {
  components: {
    Header
  },
  data() {
    return {
      cart: [],
    };
  },
  computed: {
    totalPrice() {
      return this.cart.reduce((total, item) => total + item.price * item.quantity, 0);
    },
  },
  methods: {
    removeFromCart(id) {
      this.cart = this.cart.filter((item) => item.id !== id);
      localStorage.setItem("cart", JSON.stringify(this.cart));
    },
    checkout() {
      alert("Заказ оформлен!");
      this.cart = [];
      localStorage.removeItem("cart");
    },
  },
  mounted() {
    let savedCart = localStorage.getItem("cart");
    if (savedCart) {
      this.cart = JSON.parse(savedCart);
    }
  },
};
</script>
<style>
.cart-content {
  justify-self: anchor-center;
}
.cart-table {
  width: 100%;
  border-collapse: collapse;
  margin-top: 20px;
}

.cart-table th, .cart-table td {
  border: 1px solid #ddd;
  padding: 10px;
  text-align: center;
}

.cart-table th {
  background-color: #f4f4f4;
}

.total-price {
  font-size: 1.2rem;
  margin-top: 10px;
}

.checkout-btn {
  padding: 10px 15px;
  background-color: #28a745;
  color: white;
  border: none;
  cursor: pointer;
  margin-top: 10px;
}

.checkout-btn:hover {
  background-color: #218838;
}

</style>