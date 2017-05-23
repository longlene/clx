# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="paperclip-optimizer is a processor for Paperclip that allows you to optimize and minify uploaded JPEG and PNG files"
HOMEPAGE="https://github.com/janfoeh/paperclip-optimizer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/paperclip-3.4"
ruby_add_rdepend ">=dev-ruby/image_optim-0.9"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-2.13"
ruby_add_rdepend ">=dev-ruby/rails-3.2.13"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.7"

