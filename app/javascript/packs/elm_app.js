import { Elm } from '../../elm/Main'

const start = () => {
  document.addEventListener('DOMContentLoaded', () => {
    const target = document.createElement('div')

    document.body.appendChild(target)
    Elm.Main.init({
      node: target
    })
  })
}

export { start }
