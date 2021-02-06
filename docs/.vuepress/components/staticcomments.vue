<template>
  <div class="container">
  <div class="row">
    <div class="col-md-12">
      <form action="https://api.staticforms.xyz/submit" method="post">
        <input type="hidden" name="accessKey" value="90a46b27-8d60-42f2-9d1e-05d34a595ca5">
        <input type="hidden" name="subject" value="$page.frontmatter.titleへのコメント">
        <input type="hidden" name="redirectTo" value="https://monologuestation.netlify.app/Literary/literary_index.html">
        <div class="form-group row">
          <label for="inputName" class="col-sm-4 col-form-label">お名前</label>
          <div class="col-sm-8">
            <input type="text" name="name" class="form-control" id="inputName">
          </div>
        </div>
        <div class="form-group row">
          <label for="inputTextarea" class="col-sm-4 col-form-label" >メッセージ</label>
          <div class="col-sm-8">
            <textarea name="message" rows="3" cols="40" class="form-control" id="inputTextarea" placeholder="コメント内容をページに反映されたくない場合はその旨記載してください。" ></textarea>
          </div>
        </div>
        <div class="text-center">
          <button type="submit" class="btn btn-primary mb-2">おくる</button>
        </div>
      </form>
    </div>
  </div>
</div>
</template>