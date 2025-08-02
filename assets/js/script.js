// Mobile menu toggle
document.addEventListener("DOMContentLoaded", () => {
  const mobileMenuToggle = document.querySelector(".mobile-menu-toggle")
  const navMenu = document.querySelector(".nav-menu")

  if (mobileMenuToggle && navMenu) {
    mobileMenuToggle.addEventListener("click", () => {
      navMenu.classList.toggle("active")
    })
  }

  // Search functionality
  const searchForm = document.querySelector(".search-form")
  if (searchForm) {
    searchForm.addEventListener("submit", (e) => {
      const searchInput = document.querySelector("#search")
      if (searchInput && searchInput.value.trim() === "") {
        e.preventDefault()
        alert("Please enter a search term")
      }
    })
  }

  // Add to cart functionality
  const addToCartButtons = document.querySelectorAll(".add-to-cart")
  addToCartButtons.forEach((button) => {
    button.addEventListener("click", function (e) {
      e.preventDefault()
      const productId = this.dataset.productId

      fetch("cart_handler.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=add&product_id=${productId}&quantity=1`,
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.success) {
            updateCartCount(data.cart_count)
            showNotification("Product added to cart!", "success")
          } else {
            showNotification("Error adding product to cart", "error")
          }
        })
        .catch((error) => {
          console.error("Error:", error)
          showNotification("Error adding product to cart", "error")
        })
    })
  })

  // Update cart quantities
  const quantityInputs = document.querySelectorAll(".quantity-input")
  quantityInputs.forEach((input) => {
    input.addEventListener("change", function () {
      const productId = this.dataset.productId
      const quantity = this.value

      if (quantity < 1) {
        this.value = 1
        return
      }

      fetch("cart_handler.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/x-www-form-urlencoded",
        },
        body: `action=update&product_id=${productId}&quantity=${quantity}`,
      })
        .then((response) => response.json())
        .then((data) => {
          if (data.success) {
            location.reload() // Reload to update totals
          }
        })
    })
  })

  // Remove from cart
  const removeButtons = document.querySelectorAll(".remove-from-cart")
  removeButtons.forEach((button) => {
    button.addEventListener("click", function (e) {
      e.preventDefault()
      const productId = this.dataset.productId

      if (confirm("Are you sure you want to remove this item from cart?")) {
        fetch("cart_handler.php", {
          method: "POST",
          headers: {
            "Content-Type": "application/x-www-form-urlencoded",
          },
          body: `action=remove&product_id=${productId}`,
        })
          .then((response) => response.json())
          .then((data) => {
            if (data.success) {
              location.reload()
            }
          })
      }
    })
  })
})

function updateCartCount(count) {
  const cartCount = document.querySelector(".cart-count")
  if (cartCount) {
    cartCount.textContent = count
  }
}

function showNotification(message, type) {
  const notification = document.createElement("div")
  notification.className = `alert alert-${type === "success" ? "success" : "danger"}`
  notification.textContent = message
  notification.style.position = "fixed"
  notification.style.top = "20px"
  notification.style.right = "20px"
  notification.style.zIndex = "9999"
  notification.style.minWidth = "300px"

  document.body.appendChild(notification)

  setTimeout(() => {
    notification.remove()
  }, 3000)
}

// Form validation
function validateForm(formId) {
  const form = document.getElementById(formId)
  const inputs = form.querySelectorAll("input[required], select[required], textarea[required]")
  let isValid = true

  inputs.forEach((input) => {
    if (!input.value.trim()) {
      input.style.borderColor = "#dc3545"
      isValid = false
    } else {
      input.style.borderColor = "#ddd"
    }
  })

  return isValid
}

// Admin functions
function deleteItem(type, id) {
  if (confirm(`Are you sure you want to delete this ${type}?`)) {
    window.location.href = `admin/delete.php?type=${type}&id=${id}`
  }
}

function toggleProductStatus(productId) {
  fetch("admin/toggle_status.php", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded",
    },
    body: `product_id=${productId}`,
  })
    .then((response) => response.json())
    .then((data) => {
      if (data.success) {
        location.reload()
      }
    })
}
