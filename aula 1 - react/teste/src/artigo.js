import './App.css';
import {useState} from "react"

const Artigo = (props) => {
    const [lido, setLido] = useState(false);
    return (
        <div className="App">
            <h1>{props.titulo}</h1>
            <div>{props.texto}</div>
            <button onClick={ ()=> { lido ? setLido(false) : setLido(true) } }>Ok</button>
            { lido ? <div>Lido</div> : null }
        </div>
    )
}

export default Artigo;