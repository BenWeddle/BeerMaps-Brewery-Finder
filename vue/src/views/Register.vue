<template>
  <div id="register" class="text-center">
    <form class="form-register" @submit.prevent="register">
      <h1 class="register-header">Create Account</h1>
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
      </div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control-register"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control-register"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <input
        type="password"
        id="confirmPassword"
        class="form-control-register"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <input
      v-on:change="changeBrewerMethod"
      type="checkbox"
      id="brewerCheckbox"/>
      <label for="brewerCheckbox">Are you a brewer?</label>

      <b-form-group
        label="Select your Brewery"
        v-if="this.user.role === 'brewer'"
      >
        <b-form-select
            id="brewery-select"
            v-model="selected"
            :options="brewerySelectOptions"
            class="mb-3"
            value-field="value"
            text-field="text"
            disabled-field="notEnabled"
        ></b-form-select>
      </b-form-group>

      <button class="create-account-button" type="submit">
        Create Account
      </button>
      <router-link class="have-account-link" :to="{ name: 'login' }">Have an account?</router-link>
    </form>
  </div>
</template>

<script>
import authService from '../services/AuthService';
import BreweryService from "../services/BreweryService";
import UserService from "../services/UserService";
export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
      selected: 0,
      breweries: [],
      currentUser: {}
    };
  },
  computed: {
    brewerySelectOptions(){
      let returnOptions = []
      this.breweries.forEach((brewery) => {
        const selectObject = {
          value: brewery.breweryId,
          text: brewery.breweryName
        }
        returnOptions.push(selectObject);
      })
      return returnOptions;
    }
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } 
      else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              //Get the userId by userName
              this.getUsername();
              //Set BrewerId to UserId -- Using the Selected Brewery ID
              this.updateBrewer();
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    getUsername(){
      UserService.getUserByUsername(this.user.username).then(response => {
        this.currentUser = response.data
      })
    },
    updateBrewer(){
      console.log(this.getSelectedBrewery())
      BreweryService.updateBrewery(this.getSelectedBrewery[0])
    },
    changeBrewerMethod() {
      if (this.user.role === "user") {
        this.user.role = "brewer"
      } else if (this.user.role === "brewer") {
        this.user.role = "user"
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
    getAllBreweries(){
      BreweryService.getBreweries().then(response =>
          this.breweries = response.data
      )}
  },
  getSelectedBrewery(){
    let selectedBrewery = []
    selectedBrewery  = this.breweries.filter((brewery) =>
        brewery.breweryId === this.selected
    );
    selectedBrewery[0].brewerId = this.currentUser.userId
    return selectedBrewery;
  },
  created(){
    this.getAllBreweries();
  }
};
</script>

<style scoped>
.register-header{
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 50px;
  margin-top: 0%;
  color: rgb(0, 0, 0);
  font-family:Impact, Haettenschweiler, 'Arial Narrow Bold', sans-serif;
  
}

#register {
  display: flex;
  align-items: center;
  justify-content: center;
}

.form-control-register {
  display: flex;
  align-items: center;
  justify-content: center;
  padding-left: 5px;
  padding-right: 0px;
  margin-left: 70px;
}

.create-account-button {
  display: flex;
  align-items: center;
  justify-content: center;
  margin-left: 105px;
}

.have-account-link {
  
  margin-left: 100px;


}

</style>
