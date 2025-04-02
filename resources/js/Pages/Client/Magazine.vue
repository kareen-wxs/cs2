<template>
    <Header />
    <div class="d-flex ">
        <div class="filters d-block ml-5 mt-5">
            <div class="mb-3 mt-3">
                <input v-model="searchQuery" placeholder="Поиск по названию" class="form-control" />
            </div>
            <div class="mb-3">
                <div class="price-slider-container">
                    <input type="number" v-model.number="selectedPrices[0]" @input="updatePriceSlider"
                        class="price-input-left form-control">
                    <input type="number" v-model.number="selectedPrices[1]" @input="updatePriceSlider"
                        class="price-input-right form-control">
                    <div class="range-slider">
                        <div class="slider-track" :style="trackStyle"></div>
                        <input type="range" :min="minPrice" :max="maxPrice" v-model.number="selectedPrices[0]"
                            @input="updatePriceSlider" class="price-slider ">
                        <input type="range" :min="minPrice" :max="maxPrice" v-model.number="selectedPrices[1]"
                            @input="updatePriceSlider" class="price-slider">
                    </div>
                </div>
            </div>
            <div class="mb-3">
                <select v-model="selectedWear" class="form-control">
                    <option value="">Состояние</option>
                    <option v-for="wear in uniqueWears" :key="wear" :value="wear">{{ wear }}</option>
                </select>
            </div>
            <div class="mb-3">
                <select v-model="selectedRarity" class="form-control">
                    <option value="">Редкость</option>
                    <option v-for="rarity in uniqueRarities" :key="rarity" :value="rarity">{{ rarity }}</option>
                </select>
            </div>
        </div>
        <div class="knife-catalog">
            <h1 class="catalog-title">Каталог ножей</h1>
            <div class="knife-list">
                <div v-for="knife in knives" :key="knife.id" class="knife-item">
                    <img :src="'/storage/' + knife.image" alt="Knife Image" class="knife-image" />
                    <div class="knife-details">
                        <h2 class="knife-name mb-3"><i class="fas fa-star mr-2"></i>{{ knife.name }}</h2>
                        <p class="knife-price">Цена: <span>{{ knife.price }} ₽</span></p>
                        <p class="knife-wear">Состояние: <span>{{ knife.wear }}</span></p>
                        <p class="knife-rarity">Редкость: <span>{{ knife.rarity }}</span></p>
                        <i class="view-details-button fas fa-shopping-cart" @click="addToCart(knife)"></i>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import Header from '../../Components/header.vue';
export default {
    components: {
        Header
    },
    computed: {
        trackStyle() {
            let left = ((this.selectedPrices[0] - this.minPrice) / (this.maxPrice - this.minPrice)) * 100;
            let right = ((this.selectedPrices[1] - this.minPrice) / (this.maxPrice - this.minPrice)) * 100;
            return { left: left + '%', width: (right - left) + '%' };
        }
    },
    props: ['knives'],
    data() {
        return {
            cart: [],
            minPrice: 0,
            maxPrice: 5000,
            selectedPrices: [1000, 4000]
        };
    },
    methods: {
        addToCart(knife) {
            let found = this.cart.find((item) => item.id === knife.id);
            if (found) {
                this.$set(found, 'quantity', found.quantity + 1);
            } else {
                this.cart.push({ ...knife, quantity: 1 });
            }
            this.saveCart();
            this.$inertia.visit('/cart');
        },
        removeFromCart(id) {
            this.cart = this.cart.filter((item) => item.id !== id);
            this.saveCart();
        },
        saveCart() {
            localStorage.setItem("cart", JSON.stringify(this.cart));
        },
        loadCart() {
            let savedCart = localStorage.getItem("cart");
            this.cart = savedCart ? JSON.parse(savedCart) : [];
        },
        updatePriceSlider() {
            if (this.selectedPrices[0] > this.selectedPrices[1]) {
                [this.selectedPrices[0], this.selectedPrices[1]] = [this.selectedPrices[1], this.selectedPrices[0]];
            }
        }
    },
    mounted() {
        this.loadCart();
        this.initPriceSlider();
    },
}
</script>

<style scoped>
.price-slider-container {
  display: flex;
  flex-direction: column;
  align-items: center;
}
.range-slider {
  position: relative;
  width: 300px;
  height: 6px;
  margin: 10px 0;
  background: #ccc;
  border-radius: 3px;
}
.slider-track {
  position: absolute;
  height: 6px;
  background: #007bff;
  border-radius: 3px;
}
.price-slider {
  position: absolute;
  width: 100%;
  pointer-events: none;
  -webkit-appearance: none;
  background: none;
}
.price-slider::-webkit-slider-thumb {
  pointer-events: auto;
  -webkit-appearance: none;
  width: 16px;
  height: 16px;
  background: #007bff;
  border-radius: 50%;
  cursor: pointer;
}
.price-input-left,
.price-input-right {
  width: 400px;
  margin: 5px;
}

.knife-catalog {
    padding: 20px;
    max-width: 1200px;
    margin: 0 auto;
    width: 100%;
}

.catalog-title {
    font-size: 2rem;
    text-align: center;
    color: #333;
    margin-bottom: 20px;
    margin-top: 40px;
}

p {
    color: #fff;
}

.knife-list {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
    gap: 20px;
}

.knife-item {
    background-color: #4158D0;
    background-image: linear-gradient(43deg, #4158D0 0%, #C850C0 46%, #FFCC70 100%);

    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.knife-item:hover {
    transform: translateY(-10px);
    box-shadow: 0 8px 16px rgba(255, 255, 255, 0.15);
}

.knife-image {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 10px;
    transition: opacity 0.3s ease;
}

.knife-image:hover {
    opacity: 0.8;
}

.knife-details {
    margin-top: 15px;
    text-align: center;
}

.knife-name {
    font-size: 1.2rem;
    font-weight: bold;
    color: #fff;
}

.knife-price,
.knife-wear,
.knife-rarity {
    font-size: 1rem;
}

.knife-price span,
.knife-wear span,
.knife-rarity span {
    font-weight: bold;
}

.view-details-button {
    margin-top: 10px;
    padding: 10px 15px;
    color: #fff;
    font-size: 1rem;
    cursor: pointer;
    transition: background-color 0.3s ease;
    border-radius: 5px;

}

.view-details-button:hover {
    background-color: #fff;
    border-radius: 5px;
    color: #000;
}

.filters {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-bottom: 20px;
    justify-content: center;
}
</style>
