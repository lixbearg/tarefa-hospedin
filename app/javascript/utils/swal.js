import Rails from '@rails/ujs'
import Swal from 'sweetalert2'

const DATA_CONFIRM_SWAL = 'data-confirm-swal'

const confirmed = (element, result) => {
  if (result.value) {
    element.removeAttribute(DATA_CONFIRM_SWAL)
    element.click()
  }
}

const showSwalDialog = element => {
  const message = element.getAttribute(DATA_CONFIRM_SWAL)
  const text = element.getAttribute('data-swal-text')

  Swal.fire({
    title: message || 'Você tem certeza?',
    text: text || '',
    type: 'warning',
    buttonsStyling: false,
    confirmButtonClass: 'btn btn-primary',
    cancelButtonClass: 'btn btn-light',
    showCancelButton: true,
    confirmButtonText: 'Confirmar',
    cancelButtonText: 'Cancelar'
  }).then(result => confirmed(element, result))
}

const allowAction = element => {
  if (element.getAttribute(DATA_CONFIRM_SWAL) === null) {
    return true
  }

  showSwalDialog(element)
  return false
}

function handleConfirm(element) {
  if (!allowAction(this)) {
    Rails.stopEverything(element)
  }
}

Rails.delegate(document, `a[${DATA_CONFIRM_SWAL}]`, 'click', handleConfirm)
