import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    static values = {
        delay: { type: Number, default: 4000 },
        hidden: { type: Boolean, default: false }
    }

    connect() {
        if (this.hiddenValue) return

        // Trigger enter animation
        this.element.classList.add("opacity-0", "translate-x-6")

        // Force reflow to ensure initial state is applied
        this.element.offsetHeight

        // Add transition classes and trigger animation
        this.element.classList.add("transition", "ease-out", "duration-300", "transform")

        // Use requestAnimationFrame to ensure the animation triggers
        requestAnimationFrame(() => {
            this.element.classList.remove("opacity-0", "translate-x-6")
            this.element.classList.add("opacity-100", "translate-x-0")
        })

        // Auto-hide after delay
        if (this.delayValue > 0) {
            this.timeoutId = setTimeout(() => {
                this.hide()
            }, this.delayValue)
        }
    }

    disconnect() {
        if (this.timeoutId) {
            clearTimeout(this.timeoutId)
        }
    }

    hide() {
        // Clear any pending timeout
        if (this.timeoutId) {
            clearTimeout(this.timeoutId)
        }

        // Apply leave transition
        this.element.classList.remove("ease-out", "duration-300")
        this.element.classList.add("ease-in", "duration-200")
        this.element.classList.remove("opacity-100", "translate-x-0")
        this.element.classList.add("opacity-0", "translate-x-6")

        // Remove element after transition completes
        setTimeout(() => {
            this.element.remove()
        }, 200)
    }
}