<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>
<h1>Absen Member</h1>
<br>
<div class="row">
    <div class="col-lg-5">
        <?php $form = ActiveForm::begin(); ?>
        <?= $form->field($model, 'name') ?>
        <?= $form->field($model, 'course') ?>
        <?= $form->field($model, 'pertemuan') ?>
        <?= $form->field($model, 'keterangan') ?>
        <?= Html::submitButton('Simpan', ['class' => 'btn btn-primary']) ?>
        <?php ActiveForm::end(); ?>
    </div>
</div>