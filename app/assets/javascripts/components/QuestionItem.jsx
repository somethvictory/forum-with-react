class QuestionItem extends React.Component {
  render() {
    return(
      <tr>
        <td>
          <a href={`/questions/${this.props.question.id}`} className="text-decoration-none"> { this.props.question.title } </a>
        </td>
      </tr>
    )
  }
}
