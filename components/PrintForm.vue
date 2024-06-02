<template>
    <div class="form-container">
        <form @submit.prevent="handleSubmit">
            <div class="form-group">
                <label for="text1">Text 1:</label>
                <input type="text" id="text1" v-model="text1" autocomplete="off" name="uniqueText1" />
            </div>
            <div class="form-group">
                <label for="text2">Text 2:</label>
                <input type="text" id="text2" v-model="text2" autocomplete="off" name="uniqueText2" />
            </div>
            <div class="form-group">
                <label for="text3">Text 3:</label>
                <input type="text" id="text3" v-model="text3" autocomplete="off" name="uniqueText3" />
            </div>
            <div class="button-group">
                <button v-for="n in 5" :key="n" type="button" :class="{ 'active': copies === n }"
                    @click="handleClick(n)">
                    {{ n }}
                </button>
            </div>
            <button type="submit" class="submit-button">Submit</button>
        </form>
    </div>
</template>

<script>
import axios from 'axios';

export default {
    data() {
        return {
            text1: '',
            text2: '',
            text3: '',
            copies: 1
        };
    },
    methods: {
        handleClick(number) {
            this.copies = number;
        },
        handleSubmit() {
            const jsonData = {
                TitleText: this.text1,
                SubTitleText: this.text2,
                ExtDesc: this.text3,
                Copies: this.copies
            };

            console.log('Submitting data:', jsonData);

            // Post the JSON data to the endpoint
            axios.post('https://print.mario.tech/Integration/PrintItemLabel/Execute', jsonData)
                .then(response => {
                    console.log('Data posted successfully:', response.data);
                })
                .catch(error => {
                    if (axios.isCancel(error)) {
                        console.log('Request canceled:', error.message);
                    } else if (error.response) {
                        // Server responded with a status other than 2xx
                        console.log('Error response:', error.response);
                    } else if (error.request) {
                        // Request was made but no response received
                        console.log('No response received:', error.request);
                    } else {
                        // Something else caused the error
                        console.log('Error:', error.message);
                    }
                });
        }
    }
};
</script>

<style scoped>
.form-container {
    max-width: 400px;
    margin: 0 auto;
    padding: 20px;
    background-color: #f9f9f9;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-group {
    margin-bottom: 15px;
}

.form-group label {
    display: block;
    margin-bottom: 5px;
    font-weight: bold;
}

.form-group input {
    width: 100%;
    padding: 8px;
    box-sizing: border-box;
    border: 1px solid #ccc;
    border-radius: 4px;
}

.button-group {
    display: flex;
    justify-content: space-between;
    margin-bottom: 15px;
}

.button-group button {
    flex: 1;
    margin: 5px;
    padding: 10px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.button-group button:hover {
    background-color: #0056b3;
}

.button-group button.active {
    background-color: #28a745;
    color: #fff;
}

.submit-button {
    width: 100%;
    padding: 10px;
    background-color: #28a745;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    transition: background-color 0.3s;
}

.submit-button:hover {
    background-color: #218838;
}
</style>