import React, { useState, useContext, useEffect } from "react";
import { Link, useNavigate } from "react-router-dom";

const QuestionAnswer = (props) => {
    const [answer, setAnswer] = useState("")

    function hanldeAsk() {
        console.log('You clicked ask.');
    }

    function handleLucky() {
        console.log('Lucky')
    }
    
    return (
        <React.Fragment>
            <input type="text" className="form-control" maxLength="150" placeholder="Write your question here..." aria-label="query" aria-describedby="basic-addon1"/>
            {answer && <div className="jumbotron jumbotron-fluid mt-4 p-4 rounded max-width: 50%">
                <p className="text-dark">{answer}</p>
            </div>}
            <div className="d-grid gap-3 d-md-flex mt-4">
                <button className="btn btn-lg btn-primary me-md-2" type="button" onClick={hanldeAsk}>Ask Question</button>
                <button className="btn btn-secondary btn-lg" type="button" onClick={handleLucky}>I'm feeling lucky!</button>
            </div>
        </React.Fragment>
    )
}

export default QuestionAnswer;