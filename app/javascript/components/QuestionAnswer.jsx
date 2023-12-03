import React, { useState } from "react";
import { getQuestionAnswer, getLuckyAnswer } from "../services/BookDataService";
import Answer from "./Answer";

const QuestionAnswer = (props) => {
    const [answer, setAnswer] = useState("")
    const [question, setQuestion] = useState("")
    const [asked, setAsked] = useState(false)
    const [answered, setAnswered] = useState(false)
    const [asking, setAsking] = useState(false)

    const clearState = () => {
        setAsked(false)
        setAnswered(false)
        setAsking(false)
        setQuestion("")
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
        const answer = await getQuestionAnswer(question)
        setAnswer(answer.data)
    }

    const handleLucky = async() => {
        const response = await getLuckyAnswer()
        setAsked(true)
        setQuestion(response.data.question)
        setAnswer(response.data.answer)
    }
    
    return (
        <React.Fragment>
            <input value={question} type="text" className="form-control" placeholder="Write your question here..." aria-label="question" aria-describedby="basic-addon1" onChange={(event) => { handleQuestionOnChange(event) }}/>
            {asked && <Answer answer={answer} setAnswered={setAnswered} delay={50}/>}
            {!answered && !asked &&
                <div className="d-grid gap-2 d-md-flex mt-4">
                    <button className="btn btn-dark me-md-1" type="button" onClick={handleAsk}>Ask Question</button>
                    <button className="btn btn-light" type="button" onClick={handleLucky}>I'm feeling lucky</button>
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