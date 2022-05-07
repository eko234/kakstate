declare-option str state_dir
declare-option bool load_local_state true

define-command load-state %{
    evaluate-commands %sh{
        if [ $kak_opt_load_local_state = true ]; then
            while [ "$PWD" != "/" ]; do
                if [ -f .kakstate ]; then
                    printf %s\\n "set-option global state_dir '$PWD'"
                    printf %s\\n "source '$PWD/.kakstate'"
                fi
                cd ..
            done
        fi
    }
}

define-command dump-state -params 0..1 -override %{
  nop %sh{
    if [ -d $kak_opt_state_dir ]; then
      echo "set-register a $kak_reg_a" > "$kak_opt_state_dir/.kakstate"
      echo "set-register b $kak_reg_b" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register c $kak_reg_c" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register d $kak_reg_d" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register e $kak_reg_e" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register f $kak_reg_f" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register g $kak_reg_g" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register h $kak_reg_h" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register i $kak_reg_i" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register j $kak_reg_j" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register k $kak_reg_k" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register l $kak_reg_l" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register m $kak_reg_m" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register n $kak_reg_n" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register o $kak_reg_o" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register p $kak_reg_p" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register q $kak_reg_q" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register r $kak_reg_r" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register s $kak_reg_s" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register t $kak_reg_t" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register u $kak_reg_u" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register v $kak_reg_v" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register w $kak_reg_w" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register x $kak_reg_x" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register y $kak_reg_y" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register z $kak_reg_z" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register arobase $kak_reg_arobase" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register colon $kak_reg_colon" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register caret $kak_reg_caret" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register dquote $kak_reg_dquote" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register pipe $kak_reg_pipe" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register slash $kak_reg_slash" >> "$kak_opt_state_dir/.kakstate"
      echo "set-register underscore $kak_reg_underscore" >> "$kak_opt_state_dir/.kakstate"
      echo "$kak_buflist" | tr " " "\n" | awk '/^[^\*].*[^\*]$/{print %try{ "edit " $0} }' >> "$kak_opt_state_dir/.kakstate"
      $1
    fi
  }
}

hook global KakBegin .* %{
  load-state
}

hook global KakEnd .* %{
  dump-state
}
