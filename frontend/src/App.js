import logo from './logo.svg';
import './App.css';

function App() {
  console.log(process.env)
  const backendUrl = `http://127.0.0.1:${process.env.FRONTEND_LOCAL_PORT}/hello`;
  fetch(backendUrl).then(res => console.log(res));
  
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Boogey, duba. Change App.js and save to reload.
        </p>
      </header>
    </div>
  );
}

export default App;
