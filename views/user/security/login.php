<?php
use dektrium\user\widgets\Connect;
use dektrium\user\models\LoginForm;
use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \common\models\LoginForm */

$this->title = 'Sign In';
?>

<?= $this->render('/_alert', ['module' => Yii::$app->getModule('user')]) ?>

<div class="login-box">
    <div class="login-logo">
        <a href="#"><b>Admin</b>LTE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">Sign in to start your session</p>

        <?php $form = ActiveForm::begin([
                    'id' => 'login-form',
                    'enableAjaxValidation' => true,
                    'enableClientValidation' => false,
                    'validateOnBlur' => false,
                    'validateOnType' => false,
                    'validateOnChange' => false,
                ]) ?>

                <?php if ($module->debug): ?>
                    <?= $form->field($model, 'login', [
                        'inputOptions' => [
                            'autofocus' => 'autofocus',
                            'class' => 'form-control',
                            'tabindex' => '1']])->dropDownList(LoginForm::loginList());
                    ?>

                <?php else: ?>

                    <?= $form->field($model, 'login',
                        ['inputOptions' => ['autofocus' => 'autofocus', 'class' => 'form-control', 'tabindex' => '1']]
                    );
                    ?>

                <?php endif ?>

                <?php if ($module->debug): ?>
                    <div class="alert alert-warning">
                        <?= Yii::t('user', 'Password is not necessary because the module is in DEBUG mode.'); ?>
                    </div>
                <?php else: ?>
                    <?= $form->field(
                        $model,
                        'password',
                        ['inputOptions' => ['class' => 'form-control', 'tabindex' => '2']])
                        ->passwordInput()
                        ->label(
                            Yii::t('user', 'Password')
                            . ($module->enablePasswordRecovery ?
                                ' (' . Html::a(
                                    Yii::t('user', 'Forgot password?'),
                                    ['/user/recovery/request'],
                                    ['tabindex' => '5']
                                )
                                . ')' : '')
                        ) ?>
                <?php endif ?>

                <?= $form->field($model, 'rememberMe')->checkbox(['tabindex' => '3']) ?>

                <?= Html::submitButton(
                    Yii::t('user', 'Sign in'),
                    ['class' => 'btn btn-primary btn-block', 'tabindex' => '4']
                ) ?>

                <?php ActiveForm::end(); ?>

         <?php if ($module->enableConfirmation): ?>
            <p class="text-center">
                <?= Html::a(Yii::t('user', 'Didn\'t receive confirmation message?'), ['/user/registration/resend']) ?>
            </p>
        <?php endif ?>
        <?php if ($module->enableRegistration): ?>
            <p class="text-center">
                <?= Html::a(Yii::t('user', 'Don\'t have an account? Sign up!'), ['/user/registration/register']) ?>
            </p>
        <?php endif ?>
        <?= Connect::widget([
            'baseAuthUrl' => ['/user/security/auth'],
        ]) ?>

    </div>
    <!-- /.login-box-body -->
</div><!-- /.login-box -->
