import axios from "axios";

export const getQuestionAnswer = (question) => axios.get(`/api/v1/book/ask?question=${question}`);
export const getLuckyAnswer = () => axios.get('/api/v1/book/lucky');
