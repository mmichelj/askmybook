import React, { useState } from "react";
import { getQuestionAnswer, getLuckyAnswer } from "../services/BookDataService";
import Answer from "./Answer";

const QuestionAnswer = (props) => {
    const [answer, setAnswer] = useState("")
    const [question, setQuestion] = useState("")
    const [askQuestion, setAskQuestion] = useState("Ask Question")
    const [asked, setAsked] = useState(false)
    const [answered, setAnswered] = useState(false)

    const clearState = () => {
        setAsked(false)
        setAnswered(false)
        setAskQuestion("Ask Question")
        setQuestion("")
        setAnswer("")
    }

    const handleQuestionOnChange = (event) => {
        setQuestion(event.target.value)
    }

    const hanldeAnother = () => {
        clearState()
    }

    const handleAsk = async() => {
        if(!question) return
        setAsked(true)
        setAskQuestion("Asking...")
        const answer = await getQuestionAnswer(question)
        setAnswer(answer.data)
    }

    const handleLucky = async() => {
        setAsked(true)
        setAskQuestion("Asking...")
        const response = await getLuckyAnswer()
        setQuestion(response.data.question)
        setAnswer(response.data.answer)
    }
    
    return (
        <React.Fragment>
            <textarea value={question} type="text" className="form-control" placeholder="Write your question here..." aria-label="question" aria-describedby="basic-addon1" onChange={(event) => { handleQuestionOnChange(event) }}/>
            {asked && <Answer answer={answer} setAnswered={setAnswered} delay={50}/>}
            {(!answered && !asked || asked && !answer) &&
                <div className="d-grid gap-2 d-md-flex mt-4">
                    <button className="btn btn-dark me-md-1" type="button" onClick={handleAsk} disabled={asked && !answer}>{askQuestion}</button>
                    <button className="btn btn-light border-0" type="button" onClick={handleLucky} disabled={asked && !answer}>I'm feeling lucky</button>
                </div>
            }
            {answered &&
                <div className="d-grid gap-3 d-md-flex mt-4">
                    <button className="btn btn-dark me-md-1" type="button" onClick={hanldeAnother}>Ask another question</button>
                </div>
            }
        </React.Fragment>
    )
}

export default QuestionAnswer;