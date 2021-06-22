<?php

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;
?>
<h1>Employee</h1>
<?php $form = ActiveForm::begin(); ?>
<?= $form->field($model, 'name') ?>
<?= $form->field($model, 'course') ?>
<?= $form->field($model, 'pertemuan') ?>
<?= $form->field($model, 'status') ?>

<?= Html::submitButton('Simpan', ['class' => 'btn btn-primary']) ?>
<?php ActiveForm::end(); ?>