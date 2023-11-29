class OpenaiService

    OPENAI_EMBEDDING_MODEL = 'text-embedding-ada-002'
    OPENAI_CHAT_MODEL = 'gpt-4'
    OPENAI_INITIAL_PROMPT = 'Your mission is to respond a question using the provided context information. The context is enclosd in CONTEXT tags. If the answer is in the context give the answer without any comment. If the answer is not in the context, you politely refuse. Do not answer anything outside of the provided context: <CONTEXT>#{context}</CONTEXT>'

    def self.calculate_embeddings(text)
        client = OpenAI::Client.new
        response = client.embeddings(
            parameters: {
                model: OPENAI_EMBEDDING_MODEL,
                input: text
            }
        )
        response['data'][0]['embedding']
    end

    def self.ask_gpt(context, question)
        # messages = [
        #     { role: "system", content: OPENAI_INITIAL_PROMPT },
        #     { role: "user", content: question }
        # ]

        # response = OpenAI::Completion.create(
        #     model: OPENAI_CHAT_MODEL,
        #     messages: messages,
        #     max_tokens: 500
        # )

        # response['choices'][0]['message']['content']
    end 
end