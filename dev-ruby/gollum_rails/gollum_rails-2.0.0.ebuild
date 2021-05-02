# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A simple git based wiki, as a rails engine"
HOMEPAGE="https://github.com/dancinglightning/gollum_rails"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rails-4.0"
ruby_add_rdepend ">=dev-ruby/rugged-0.21"
ruby_add_rdepend ">=dev-ruby/sass-rails-4.0"
ruby_add_rdepend ">=dev-ruby/haml-4.0"
ruby_add_rdepend ">=dev-ruby/jquery-rails-3.1"
ruby_add_rdepend ">=dev-ruby/coffee-rails-4.0"
ruby_add_rdepend ">=dev-ruby/jquery-ui-rails-5.0"
ruby_add_rdepend ">=dev-ruby/bootstrap-sass-3.1"
ruby_add_rdepend ">=dev-ruby/bootstrap_form-2.2"
ruby_add_rdepend ">=dev-ruby/paperclip-4.1"
ruby_add_rdepend ">=dev-ruby/rails-i18n-4.0"
ruby_add_rdepend ">=dev-ruby/html-pipeline-1.0"
ruby_add_rdepend ">=dev-ruby/rinku-1.7"
ruby_add_rdepend ">=dev-ruby/sanitize-3.0"
ruby_add_rdepend ">=dev-ruby/github-markdown-0.6"

