import React, { useState } from "react";
import { getQuestionAnswer, getLuckyAnswer } from "../services/BookDataService";

const QuestionAnswer = (props) => {
    const [answer, setAnswer] = useState("")
    const [question, setQuestion] = useState("");

    const handleQuestionOnChange = (event) => {
        setQuestion(event.target.value)
    }

    const handleAsk = async() => {
        if(!question) return
        const answer = await getQuestionAnswer(question)
        setAnswer(answer.data)
    }

    const handleLucky = async() => {
        const response = await getLuckyAnswer()
        setQuestion(response.data.question)
        setAnswer(response.data.answer)
    }
    
    return (
        <React.Fragment>
            <input value={question} type="text" className="form-control" placeholder="Write your question here..." aria-label="question" aria-describedby="basic-addon1" onChange={(event) => { handleQuestionOnChange(event) }}/>
            {answer && <div className="jumbotron mt-4 p-4 rounded">
                <div className="overflow-auto pe-2"><p className="text-black-wrap">{answer}</p></div>
            </div>}
            <div className="d-grid gap-3 d-md-flex mt-4">
                <button className="btn btn-lg btn-primary me-md-2" type="button" onClick={handleAsk}>Ask Question</button>
                <button className="btn btn-secondary btn-lg" type="button" onClick={handleLucky}>I'm feeling lucky!</button>
            </div>
        </React.Fragment>
    )
}

export default QuestionAnswer;