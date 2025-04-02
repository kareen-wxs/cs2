<script>
export default {
data() {
    return {
        minPrice: 0,
        maxPrice: 5000,
        selectedPrices: [1000, 4000]
    };
},
mounted() {
    this.initPriceSlider();
},
methods: {
    updatePriceSlider() {
      if (this.selectedPrices[0] > this.selectedPrices[1]) {
        [this.selectedPrices[0], this.selectedPrices[1]] = [this.selectedPrices[1], this.selectedPrices[0]];
      }
    }
}
}
</script>
<template>
    <div class="price-slider-container">
        <input type="text" class="price-input-left" v-model="selectedPrices[0]" @change="updatePriceSlider" />
        <input type="text" class="price-input-right" v-model="selectedPrices[1]" @change="updatePriceSlider" />
        <div ref="priceSlider" class="price-slider"></div>
    </div>
</template>
