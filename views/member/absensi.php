<?php

use \yii\helpers\Url;
/* @var $this yii\web\View */

$this->title = '';
?>
<div class="site-index">

    <div class="jumbotron">
        <h2>Selamat Datang ! </h2>

        <p class="lead">Silahkan absen dan tulis di kolom keterangan</p>


    </div>
    <div class="site-index">
        <div class="jumbotron">
            <p><a class="btn btn-warning" href="<?= Url::to(['create']) ?>">Absen</a></p>
        </div>
    </div>
    <div class="body-content">



    </div>
</div>