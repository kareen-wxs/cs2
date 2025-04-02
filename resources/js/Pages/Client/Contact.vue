<template>
    <div>
      <Header />
      <div class="contact-container">
        <h1>Контакты</h1>
        <p>Свяжитесь с нами по любым вопросам.</p>
        <div class="contact-details">
          <p><strong>Адрес:</strong> 2A0, Queenstown St, USA</p>
          <p><strong>Email:</strong> supporthere@mail.com</p>
          <p><strong>Телефон:</strong> +1 234 567 890</p>
        </div>
      </div>
    </div>
  </template>
  
  <script>
  import Header from '../../Components/header.vue';
  
  export default {
    name: 'Contact',
    components: {
      Header
    }
  };
  </script>
  
  <style scoped>
  .contact-container {
    max-width: 800px;
    margin: 20px auto;
    padding: 20px;
    background: #f9f9f9;
    border-radius: 8px;
    text-align: center;
  }
  .contact-details p {
    font-size: 18px;
    margin: 10px 0;
  }
  </style>
  