# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Optical mark recognition of multiple-choice tests and surveys"
HOMEPAGE="https://github.com/giuseb/mork"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/narray-0.6"
ruby_add_rdepend ">=dev-ruby/mini_magick-4.5"
ruby_add_rdepend ">=dev-ruby/prawn-2.1"
ruby_add_rdepend ">=dev-ruby/deep_merge-1.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/guard-2.6"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3"
ruby_add_rdepend ">=dev-ruby/guard-shell-0.6"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.2"
ruby_add_rdepend ">=dev-ruby/byebug-9.0"

